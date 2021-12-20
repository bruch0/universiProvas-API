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
  it("should return code 400 when universityId is negative", async () => {
    const universityId = faker.datatype.number(0);
    const result = await request.get(`/courses/${universityId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is 0", async () => {
    const result = await request.get("/courses/0");

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is a string", async () => {
    const universityId = faker.datatype.string();
    const result = await request.get(`/courses/${universityId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 200 when universityId is a number between 1 and 69", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });
    const result = await request.get(`/courses/${universityId}`);

    expect(result.status).toEqual(200);
  });

  it("should return code 200 when universityId is 69", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });
    const result = await request.get(`/courses/${universityId}`);

    expect(result.status).toEqual(200);
  });

  it("should return code 404 when universityId is greater than 69", async () => {
    const result = await request.get("/courses/70");

    expect(result.status).toEqual(404);
  });
});
