import { DeleteResult, Repository } from 'typeorm';
import { User } from '../../entities/user.entity';
export declare class UserRepo {
    private readonly db;
    constructor(db: Repository<User>);
    insert(user: User): Promise<User>;
    findOne(id: string): Promise<User>;
    findByUsernameAndPassword(username: string, password: string): Promise<User>;
    update(user: User): Promise<User>;
    delete(id: string): Promise<DeleteResult>;
    getConnectedUsers(): Promise<User[]>;
}
