import { getManager, getConnection } from "typeorm";
import { Professor } from "../interfaces/professor";
import { Professors } from "../entities/professors";
import { ProfessorCourses } from "../entities/professorsCourses";
import { TestCount } from "../interfaces/testCount";
import { Courses } from "../entities/courses";
import { Tests } from "../entities/tests";

const getUniversityProfessors = async (
  universityId: number,
  courseId: number
) => {
  const professors: Professor[] = await getConnection()
    .createQueryBuilder()
    .select(["professors.id as id", "professors.name as name"])
    .from(Professors, "professors")
    .leftJoin(
      ProfessorCourses,
      "professors_courses",
      "professors_courses.professor_id = professors.id"
    )
    .where(`professors.university_id = ${universityId}`)
    .andWhere(`professors_courses.course_id = ${courseId}`)
    .execute();

  let auxQuery = "";
  professors.forEach((professor) => {
    auxQuery += `professor_id = ${professor.id} OR `;
  });

  const query = auxQuery.substring(0, auxQuery.length - 4);

  const professorTests = await getConnection()
    .createQueryBuilder()
    .select("tests.professor_id as professorid")
    .from(Tests, "tests")
    .where(query)
    .andWhere(`tests.course_id = ${courseId}`)
    .execute();

  professors.forEach((professor) => {
    const totalTests = professorTests.filter(
      (test: any) => test.professorid === professor.id
    );
    professor.totalTests = totalTests.length || "0";
  });

  const course = await getConnection()
    .createQueryBuilder()
    .select("courses.name as name")
    .from(Courses, "courses")
    .where(`id = ${courseId}`)
    .execute();

  return { professors, course: course[0].name };
};

export { getUniversityProfessors };
