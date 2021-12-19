import { getConnection } from "typeorm";
import dayjs from "dayjs";

import { Professors } from "../entities/professors";
import { Subjects } from "../entities/subjects";

const getTestNeededInfo = async () => {
  const professors = await getConnection()
    .createQueryBuilder()
    .select(["professors.name as name", "professors.id as id"])
    .from(Professors, "professors")
    .execute();

  const subjects = await getConnection()
    .createQueryBuilder()
    .select(["subjects.name as name", "subjects.id as id"])
    .from(Subjects, "subjects")
    .execute();

  const minimumPeriod = dayjs().subtract(3, "year").format("YYYY");
  const availablePeriods = [];

  for (let i = 0; i < 3; i++) {
    for (let j = 1; j < 3; j++) {
      availablePeriods.push(
        `${dayjs(minimumPeriod).add(i, "years").format("YYYY")}.${j}`
      );
    }
  }

  if (dayjs().month() > 6)
    availablePeriods.push(
      `${dayjs(minimumPeriod).add(3, "years").format("YYYY")}.1`
    );

  return { professors, subjects, availablePeriods };
};

export { getTestNeededInfo };
