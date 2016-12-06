//
//  PhoneBook+CoreDataProperties.h
//  
//
//  Created by MAC on 2016/12/6.
//
//  This file was automatically generated and should not be edited.
//

#import "PhoneBook+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PhoneBook (CoreDataProperties)

+ (NSFetchRequest<PhoneBook *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phonenumber;
@property (nullable, nonatomic, copy) NSString *email;

@end

NS_ASSUME_NONNULL_END
