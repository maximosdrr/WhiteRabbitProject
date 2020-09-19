import { User } from './entities/user.entity';
import { UserRepositoryHandler } from './repositories/user/handler';
export declare class UserService {
    private readonly handler;
    constructor(handler: UserRepositoryHandler);
    insert(user: User): Promise<User>;
    delete(id: string): Promise<boolean>;
    updateUserStatus(id: string, status: boolean): Promise<User>;
    getConnectedUsers(): Promise<User[]>;
}
