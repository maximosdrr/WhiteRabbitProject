import { Message } from './message.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  id?: string;

  @Column({ nullable: false })
  name: string;

  @Column({ nullable: false, unique: true })
  username: string;

  @Column({ nullable: false })
  password?: string;

  @Column({ default: 'rabbit' })
  icon?: string;

  @Column({ default: false })
  online?: boolean;

  @OneToMany(
    type => Message,
    message => message.user,
  )
  message: Message;
}
