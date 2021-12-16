import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("professors_courses")
export class ProfessorCourses {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  professor_id: number;

  @Column()
  course_id: number;
}
