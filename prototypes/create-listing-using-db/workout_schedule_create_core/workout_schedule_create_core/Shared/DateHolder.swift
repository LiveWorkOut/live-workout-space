
import CoreData

class DateHolder: ObservableObject
{
    @Published var date = Date()
    @Published var taskItems: [Item] = []
    @Published var workoutSchedule: [WorkoutSchedule] = []
    @Published var workouts: [Workout] = []
    
    let calendar: Calendar = Calendar.current
    
    func moveDate(_ days: Int,_ context: NSManagedObjectContext)
    {
        date = calendar.date(byAdding: .day, value: days, to: date)!
        refreshTaskItems(context)
    }
        
    init(_ context: NSManagedObjectContext)
    {
        refreshTaskItems(context)
    }
    
    func refreshTaskItems(_ context: NSManagedObjectContext)
    {
        taskItems = fetchTaskItems(context)
        workouts = fetchWorkouts(context)
        
    }
    
    func refreshScheduleWorkout(_ context: NSManagedObjectContext){
        workoutSchedule = fetchWorkoutSchedule(context)
    }

    func refreshWorkout(_ context: NSManagedObjectContext){
        workouts = fetchWorkouts(context)
    }
    
    func fetchTaskItems(_ context: NSManagedObjectContext) -> [Item]
    {
        do
        {
            return try context.fetch(dailyTasksFetch()) as [Item]
        }
        catch let error
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func fetchWorkoutSchedule(_ context: NSManagedObjectContext) -> [WorkoutSchedule]
    {
        do
        {
            return try context.fetch(dailyTasksFetch()) as [WorkoutSchedule]
        }
        catch let error
        {
            fatalError("Unresolved error \(error)")
        }
    }

    func fetchWorkouts(_ context: NSManagedObjectContext) -> [Workout]
    {
        do
        {
            return try context.fetch(dailyTasksFetch()) as [Workout]
        }
        catch let error
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func dailyTasksFetch() -> NSFetchRequest<Item>
    {
        let request = Item.fetchRequest()
        
        request.sortDescriptors = sortOrder()
        request.predicate = predicate()
        return request
    }
    
    private func sortOrder() -> [NSSortDescriptor]
    {
        let completedDateSort = NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)
        let timeSort = NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)
        let dueDateSort = NSSortDescriptor(keyPath: \Item.isCompleted, ascending: true)
        
        return [completedDateSort, timeSort, dueDateSort]
    }
    
    private func predicate() -> NSPredicate
    {
        let start = calendar.startOfDay(for: date)
        let end = calendar.date(byAdding: .day, value: 1, to: start)
        return NSPredicate(format: "timestamp >= %@ AND timestamp < %@", start as NSDate, end! as NSDate)
    }
    
    func saveContext(_ context: NSManagedObjectContext)
    {
        do {
            try context.save()
            refreshTaskItems(context)
            refreshScheduleWorkout(context)
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
