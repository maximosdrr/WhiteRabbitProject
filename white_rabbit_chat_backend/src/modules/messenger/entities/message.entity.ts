import { User } from 'src/modules/user/entities/user.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Message {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ default: 'Mensagem vazia' })
  content: string;

  @ManyToOne(
    type => User,
    user => user.message,
    { nullable: false },
  )
  user: User;

  @CreateDateColumn()
  createdAt: string;
}
