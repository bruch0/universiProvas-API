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
    const universityId = faker.datatype.number(-1);

    const courseId = faker.datatype.number({
      min: 1,
      max: 321,
    });

    const result = await request.get(`/subjects/${universityId}/${courseId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is zero", async () => {
    const courseId = faker.datatype.number({
      min: 1,
      max: 321,
    });

    const result = await request.get(`/subjects/0/${courseId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is greater than 69", async () => {
    const courseId = faker.datatype.number({
      min: 1,
      max: 321,
    });

    const result = await request.get(`/subjects/70/${courseId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is valid but courseId is negative", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });

    const courseId = faker.datatype.number(-1);

    const result = await request.get(`/subjects/${universityId}/${courseId}`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is valid but courseId is zero", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });

    const result = await request.get(`/subjects/${universityId}/0`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is valid but courseId is greater than 321", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });

    const result = await request.get(`/subjects/${universityId}/322`);

    expect(result.status).toEqual(400);
  });

  it("should return code 400 when universityId is between 1 and 69 and the courseId is between 1 and 321", async () => {
    const universityId = faker.datatype.number({
      min: 1,
      max: 69,
    });

    const courseId = faker.datatype.number({
      min: 1,
      max: 321,
    });

    const result = await request.get(`/subjects/${universityId}/${courseId}`);

    expect(result.status).toEqual(200);
  });
});
