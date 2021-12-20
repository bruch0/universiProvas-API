import { getConnection } from "typeorm";
import { Professors } from "../entities/professors";
import { Tests } from "../entities/tests";
import { TestTypes } from "../entities/testTypes";

const getProfessorTests = async (professorId: number) => {
  const professorTests = await getConnection()
    .createQueryBuilder()
    .select([
      "tests.year as period",
      "tests.url as url",
      "test_types.name as name",
    ])
    .from(Tests, "tests")
    .leftJoin(TestTypes, "test_types", "tests.type_id = test_types.id")
    .where(`tests.professor_id = ${professorId}`)
    .execute();

  const professor = await getConnection()
    .createQueryBuilder()
    .select("professors.name as name")
    .from(Professors, "professors")
    .where(`professors.id = ${professorId}`)
    .execute();

  const groupedTests: any = [];
  const groupedTypes: any = [];

  professorTests.forEach((type: any) => {
    const testType = type.name;
    const auxFilter: any = [];

    if (!groupedTypes.includes(testType)) {
      professorTests.forEach((test: any) => {
        if (test.name === testType) {
          auxFilter.push({ period: test.period, url: test.url });
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

  return { tests: groupedTests, professor: professor[0].name };
};

export { getProfessorTests };
