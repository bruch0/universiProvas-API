import { getManager } from "typeorm";
import { Professor } from "../interfaces/professor";
import { TestCount } from "../interfaces/testCount";

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

  professors.forEach((professor) => {
    professor.totalTests = testsCount.find(
      (test: TestCount) => test.professor_id === professor.id
    );

    professor.totalTests = Number(professor.totalTests?.count) || 0;
  });

  return professors;
};

export { getUniversityProfessors };
