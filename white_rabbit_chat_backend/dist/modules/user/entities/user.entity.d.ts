import { Message } from 'src/modules/messenger/entities/message.entity';
export declare class User {
    id?: string;
    name: string;
    username: string;
    password?: string;
    icon?: string;
    online?: boolean;
    message: Message;
}
