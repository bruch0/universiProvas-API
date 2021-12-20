import { getConnection } from "typeorm";
import { Professors } from "../entities/professors";
import { Subjects } from "../entities/subjects";
import { Tests } from "../entities/tests";
import { TestTypes } from "../entities/testTypes";

const getSubjectTests = async (universityId: number, subjectId: number) => {
  const subjectTests = await getConnection()
    .createQueryBuilder()
    .select([
      "tests.year as period",
      "tests.url as url",
      "test_types.name as name",
      "professors.name as professor",
    ])
    .from(Tests, "tests")
    .leftJoin(TestTypes, "test_types", "tests.type_id = test_types.id")
    .leftJoin(Professors, "professors", "professors.id = tests.professor_id")
    .where(`professors.university_id = ${universityId}`)
    .andWhere(`tests.subject_id = ${subjectId}`)
    .execute();

  const subject = await getConnection()
    .createQueryBuilder()
    .select("subjects.name as name")
    .from(Subjects, "subjects")
    .where(`subjects.id = ${subjectId}`)
    .execute();

  const groupedTests: any = [];
  const groupedTypes: any = [];

  subjectTests.forEach((type: any) => {
    const testType = type.name;
    const auxFilter: any = [];

    if (!groupedTypes.includes(testType)) {
      subjectTests.forEach((test: any) => {
        if (test.name === testType) {
          auxFilter.push({
            period: test.period,
            url: test.url,
            professor: test.professor,
          });
        }
      });

      if (auxFilter.length) {
        groupedTests.push({
          type: testType,
          tests: auxFilter,
        });
      }

      groupedTypes.push(testType);
    }
  });

  return { tests: groupedTests, subject: subject[0].name };
};

export { getSubjectTests };
