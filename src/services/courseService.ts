import { getRepository } from "typeorm";
import { UniversitiesCourses } from "../entities/universitiesCourses";
import { Courses } from "../entities/courses";

const getCoursesByUniversity = async (universityId: number) => {
  const universitiesCoursesIds = await getRepository(UniversitiesCourses).find({
    university_id: universityId,
  });

  const courses = await getRepository(Courses).find();

  const universitiesCourses: any = [];

  universitiesCoursesIds.forEach((university) => {
    courses.forEach((course) => {
      if (course.id === university.course_id) {
        universitiesCourses.push({
          name: course.name,
          type: course.type,
          id: course.id,
        });
      }
    });
  });

  return universitiesCourses;
};

export { getCoursesByUniversity };
