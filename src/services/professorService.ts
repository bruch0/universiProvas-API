import { getManager, getRepository } from "typeorm";
import { Professor } from "../interfaces/professor";
import { TestCount } from "../interfaces/testCount";
import { Courses } from "../entities/courses";

const getUniversityProfessors = async (
  universityId: number,
  courseId: number
) => {
  const professors: Professor[] = await getManager().query(
    "SELECT professors.id, professors.name FROM professors JOIN professors_courses ON professors.id = professors_courses.professor_id WHERE professors_courses.course_id = $1 AND professors.university_id = $2",
    [courseId, universityId]
  );

  const testsCount = await getManager().query(
    "SELECT professor_id, COUNT(*) FROM tests GROUP by professor_id"
  );

  const courses = await getRepository(Courses).find({ id: courseId });

  professors.forEach((professor) => {
    professor.totalTests = testsCount.find(
      (test: TestCount) => test.professor_id === professor.id
    );

    professor.totalTests = professor.totalTests?.count || "0";
  });

  return { professors, course: courses[0].name };
};

export { getUniversityProfessors };
