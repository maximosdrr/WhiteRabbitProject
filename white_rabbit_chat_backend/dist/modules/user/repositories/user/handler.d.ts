import { User } from '../../entities/user.entity';
import { UserRepo } from './repository';
export declare class UserRepositoryHandler {
    private readonly userRepo;
    constructor(userRepo: UserRepo);
    insert(user: User): Promise<User>;
    findOneByUsernameAndPassword(username: string, password: string): Promise<User>;
    updateUserStatus(id: string, status: boolean): Promise<User>;
    deleteUser(id: string): Promise<boolean>;
    getConnectedUsers(): Promise<User[]>;
    private filterUserInfo;
}
