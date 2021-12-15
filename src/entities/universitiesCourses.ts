import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("universities_courses")
export class UniversitiesCourses {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  university_id: number;

  @Column()
  course_id: number;
}

// SELECT universities_courses.*, courses.name FROM universities_courses JOIN courses ON universities_courses.course_id = courses.id;
