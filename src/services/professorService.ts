import { getManager } from "typeorm";
import { Professors } from "../entities/professors";

const getUniversityProfessors = async (
  universityId: number,
  courseId: number
) => {
  const professors = await getManager().query(
    "SELECT professors.name FROM professors JOIN professors_courses ON professors.id = professors_courses.professor_id WHERE professors_courses.course_id = $1 AND professors.university_id = $2",
    [courseId, universityId]
  );

  return professors;
};

export { getUniversityProfessors };
