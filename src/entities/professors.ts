import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("professors")
export class Professors {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  university_id: number;
}
