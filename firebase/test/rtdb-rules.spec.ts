/// <reference lib="dom" />
import * as firebase from '@firebase/rules-unit-testing';

const rules = require('fs').readFileSync(`${__dirname}/../database.rules.json`);
const { assertFails, assertSucceeds, database: databaseFactory, initializeTestApp } = firebase;

const projectId = 'test';
const databaseName = 'test';
process.env.FIREBASE_DATABASE_EMULATOR_HOST = 'localhost:19300';

firebase.loadDatabaseRules({ databaseName, rules });

const app = initializeTestApp({
  projectId,
  databaseName,
  auth: { uid: 'alice' },
});
const database = databaseFactory(app);

afterAll(async () => {
  await app.delete();
});

describe('Realtime Database security rules', () => {
  test('can only update own `/fcmTokens/:uid`', async () => {
    await assertSucceeds(database.ref('/fcmTokens').child('alice').set('foo'));
    await assertFails(database.ref('/fcmTokens').child('bob').set('foo'));
  });
});
