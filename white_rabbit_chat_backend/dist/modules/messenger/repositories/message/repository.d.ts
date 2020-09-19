import { DeleteResult, Repository } from 'typeorm';
import { Message } from '../../entities/message.entity';
export declare class MessageRepo {
    private readonly db;
    constructor(db: Repository<Message>);
    insert(message: Message): Promise<Message>;
    findAll(): Promise<Message[]>;
    delete(id: string): Promise<DeleteResult>;
}
