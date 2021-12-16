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
