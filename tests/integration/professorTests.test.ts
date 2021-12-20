import supertest from "supertest";
import { getConnection } from "typeorm";
import faker from "faker";

import app, { init } from "../../src/app";

beforeAll(async () => {
  await init();
});

afterAll(async () => {
  await getConnection().close();
});

const request = supertest(app);

describe("get universities", () => {
  it("should return code 400 when professorId is negative", async () => {
    const professorId = faker.datatype.number(-1);
    const result = await request.get(`/professors/${professorId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when professorId is 0", async () => {
    const result = await request.get("/professors/0");

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when professorId is a string", async () => {
    const professorId = faker.datatype.string();
    const result = await request.get(`/professors/${professorId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 200 when professorId is a number between 1 and 69", async () => {
    const professorId = faker.datatype.number({
      min: 1,
      max: 69,
    });
    const result = await request.get(`/professors/${professorId}`);

    expect(result.status).toEqual(200);
  });

  it("should return code 200 when professorId is greater than 0", async () => {
    const professorId = faker.datatype.number({
      min: 1,
      max: 9999999999999,
    });
    const result = await request.get(`/professors/${professorId}`);

    expect(result.status).toEqual(200);
  });
});
