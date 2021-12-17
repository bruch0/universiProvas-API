import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("subjects")
export class Subjects {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  code: string;
}
