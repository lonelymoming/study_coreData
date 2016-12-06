//
//  PhoneBook+CoreDataProperties.m
//  
//
//  Created by MAC on 2016/12/6.
//
//  This file was automatically generated and should not be edited.
//

#import "PhoneBook+CoreDataProperties.h"

@implementation PhoneBook (CoreDataProperties)

+ (NSFetchRequest<PhoneBook *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"PhoneBook"];
}

@dynamic name;
@dynamic phonenumber;
@dynamic email;

@end
