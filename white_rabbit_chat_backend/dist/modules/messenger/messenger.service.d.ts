import { Message } from './entities/message.entity';
import { MessageRepositoryHandler } from './repositories/message/handler';
export declare class MessengerService {
    private readonly messageRepositoryHandler;
    constructor(messageRepositoryHandler: MessageRepositoryHandler);
    insert(message: Message): Promise<Message>;
    findAll(): Promise<Message[]>;
    delete(id: string): Promise<boolean>;
}
