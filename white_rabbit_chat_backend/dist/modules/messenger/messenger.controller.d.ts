import { Message } from './entities/message.entity';
import { MessengerGateway } from './messenger.gateway';
import { MessengerService } from './messenger.service';
export declare class MessengerController {
    private readonly messengerService;
    private readonly messengeGateway;
    constructor(messengerService: MessengerService, messengeGateway: MessengerGateway);
    insert(message: Message, req: any): Promise<Message>;
    findAll(): Promise<Message[]>;
    delete(id: string): Promise<boolean>;
}
