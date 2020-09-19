import { User } from 'src/modules/user/entities/user.entity';
export declare class Message {
    id: string;
    content: string;
    user: User;
    createdAt: string;
}
