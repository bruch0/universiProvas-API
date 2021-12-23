import { getConnection } from "typeorm";
import dayjs from "dayjs";

import { Professors } from "../entities/professors";
import { Subjects } from "../entities/subjects";
import { uploadFileS3 } from "./aws/uploadFile";
import { Tests } from "../entities/tests";
import { TestTypes } from "../entities/testTypes";
import { ProfessorCourses } from "../entities/professorsCourses";

const getTestNeededInfo = async (courseId: number) => {
  const professors = await getConnection()
    .createQueryBuilder()
    .select(["professors.name as name", "professors.id as id"])
    .leftJoin(
      ProfessorCourses,
      "professors_courses",
      "professors.id = professors_courses.professor_id"
    )
    .from(Professors, "professors")
    .where(`professors_courses.course_id = ${courseId}`)
    .execute();

  const testTypes = await getConnection()
    .createQueryBuilder()
    .select(["test_types.name as name", "test_types.id as id"])
    .from(TestTypes, "test_types")
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
      availablePeriods.push({
        name: `${dayjs(minimumPeriod).add(i, "years").format("YYYY")}.${j}`,
      });
    }
  }

  if (dayjs().month() > 6)
    availablePeriods.push({
      name: `${dayjs(minimumPeriod).add(3, "years").format("YYYY")}.1`,
    });

  return { professors, subjects, testTypes, availablePeriods };
};

const uploadTest = async (file: any, filename: string) => {
  const fileUrl = await uploadFileS3(file, filename);

  return fileUrl;
};

const checkTestParams = async (professorId: number, subjectId: number) => {
  const professor = await getConnection()
    .createQueryBuilder()
    .select("professors.name as name")
    .from(Professors, "professors")
    .where(`professors.id = ${professorId}`)
    .execute();

  const subject = await getConnection()
    .createQueryBuilder()
    .select("subjects.name as name")
    .from(Subjects, "subjects")
    .where(`subjects.id = ${subjectId}`)
    .execute();

  return Boolean(professor.length && subject.length);
};

const registerTestOnDatabase = async (
  fileUrl: string,
  professorId: number,
  subjectId: number,
  typeId: number,
  period: string
) => {
  await getConnection()
    .createQueryBuilder()
    .insert()
    .into(Tests)
    .values({
      professor_id: professorId,
      subject_id: subjectId,
      type_id: typeId,
      year: period,
      url: fileUrl,
    })
    .execute();
};

export {
  getTestNeededInfo,
  uploadTest,
  checkTestParams,
  registerTestOnDatabase,
};
