import { Schedules } from '@splatoon-stats/types';
import axios, { AxiosInstance, AxiosRequestConfig } from 'axios';
import axiosCookieJarSupport from 'axios-cookiejar-support';
import * as dayjs from 'dayjs';
import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
import { CallableContext } from 'firebase-functions/lib/providers/https';
import { CookieJar } from 'tough-cookie';

admin.initializeApp();
axiosCookieJarSupport(axios);

const { conf: config } = functions.config() as {
  conf: {
    iksm_session: string;
  };
};

const SPLATNET_BASE_URL = 'https://app.splatoon2.nintendo.net';
const SPLATNET_API_URL = `${SPLATNET_BASE_URL}/api`;

const getSplatnetClient = (options: Partial<AxiosRequestConfig> = {}): AxiosInstance => {
  const cookieJar = new CookieJar();
  cookieJar.setCookieSync(`iksm_session=${config.iksm_session}`, SPLATNET_BASE_URL);
  return axios.create({
    baseURL: SPLATNET_BASE_URL,
    jar: cookieJar,
    withCredentials: true,
    headers: {
      'User-Agent': 'OnlineLounge/1.6.1.2 NASDKAPI Android',
    },
    ...options,
  });
};
const getSplatnetAPIClient = (): AxiosInstance => {
  return getSplatnetClient({
    baseURL: SPLATNET_API_URL,
  });
};

type StatusResponse = { ok: boolean };

const fetchSchedules = async (
  _req: unknown,
  _context: CallableContext | null,
): Promise<StatusResponse> => {
  const database = admin.database();

  const date = new Date();
  functions.logger.debug({
    function: 'fetchSchedules',
    date: dayjs(date).format('YYYY-MM-DD hh:mm:ss'),
  });

  const { data: schedules } = await getSplatnetAPIClient().get<Schedules>('/schedules');

  await database.ref('schedules').update(schedules);

  return { ok: true };
};

if (process.env.FUNCTIONS_EMULATOR) {
  // These function are used only for local development
  exports.fetchSchedules = functions.https.onCall(fetchSchedules);
}

functions.pubsub
  .schedule('0 */2 * * *')
  .timeZone('UTC')
  .onRun(() => {
    return fetchSchedules(null, null);
  });
