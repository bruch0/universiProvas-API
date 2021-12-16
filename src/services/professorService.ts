import { getManager, getConnection } from "typeorm";
import { Professor } from "../interfaces/professor";
import { Professors } from "../entities/professors";
import { ProfessorCourses } from "../entities/professorsCourses";
import { TestCount } from "../interfaces/testCount";
import { Courses } from "../entities/courses";

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

  const testsCount = await getManager().query(
    "SELECT professor_id, COUNT(*) FROM tests GROUP by professor_id"
  );

  const courses = await getConnection()
    .createQueryBuilder()
    .select("courses.name as name")
    .from(Courses, "courses")
    .where(`id = ${courseId}`)
    .execute();

  professors.forEach((professor) => {
    professor.totalTests = testsCount.find(
      (test: TestCount) => test.professor_id === professor.id
    );

    professor.totalTests = professor.totalTests?.count || "0";
  });

  return { professors, course: courses[0].name };
};

export { getUniversityProfessors };
