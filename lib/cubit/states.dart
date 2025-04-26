abstract class TodoStates{}
class InitialState extends TodoStates{}

class ChangeBottomIndexState extends TodoStates{}

class DatabaseCreatedSuccessfully extends TodoStates{}
class DatabaseOpenedSuccessfully extends TodoStates{}
class DatabaseGetSuccessfully extends TodoStates{}
class DatabaseCreatedError extends TodoStates{}
class DatabaseGetError extends TodoStates{}
