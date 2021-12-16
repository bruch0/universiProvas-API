import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity("universities")
export class Universities {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  initials: string;
}
