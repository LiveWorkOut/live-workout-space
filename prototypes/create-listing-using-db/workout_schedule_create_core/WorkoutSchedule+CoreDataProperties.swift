//
//  WorkoutSchedule+CoreDataProperties.swift
//  workout_schedule_create_core
//
//  Created by Nene Wang  on 4/22/24.
//
//

import Foundation
import CoreData


extension WorkoutSchedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSchedule> {
        return NSFetchRequest<WorkoutSchedule>(entityName: "WorkoutSchedule")
    }

    @NSManaged public var title: String?
    @NSManaged public var startTime: Date?
    @NSManaged public var isPublic: Bool
    @NSManaged public var saveVideo: Bool
    @NSManaged public var setRecurrence: Bool
    @NSManaged public var hasPredefinedWorkout: Bool

}

extension WorkoutSchedule : Identifiable {

}
