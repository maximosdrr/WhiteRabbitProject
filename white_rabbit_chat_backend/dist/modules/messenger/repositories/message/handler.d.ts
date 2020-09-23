import { Message } from '../../../../entities/message.entity';
import { MessageRepo } from './repository';
export declare class MessageRepositoryHandler {
    private readonly messageRepo;
    constructor(messageRepo: MessageRepo);
    insert(message: Message): Promise<Message>;
    findAll(): Promise<Message[]>;
    delete(messageId: string): Promise<boolean>;
    private removeUserPassword;
}
