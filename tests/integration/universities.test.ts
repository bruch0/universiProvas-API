import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await getConnection().close();
});

const request = supertest(app);

describe("get universities", () => {
  it("should return code 200", async () => {
    const result = await request.get("/universities");

    expect(result.status).toEqual(200);
  });
});
