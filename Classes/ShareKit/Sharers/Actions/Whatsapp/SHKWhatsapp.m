//
//  SHKWhatsapp.m
//  Pods
//
//  Created by Daniel Haight on 12/08/2013.
//
//

#import "SHKWhatsapp.h"

@interface SHKWhatsapp ()

@end

@implementation SHKWhatsapp

#pragma mark -
#pragma mark Configuration : Service Defination

// Enter the name of the action
+ (NSString *)sharerTitle
{
	return SHKLocalizedString(@"Whatsapp");
}


 + (BOOL)canShareURL
 {
     return YES;
 }


 + (BOOL)canShareImage
 {
     return NO;
 }


 + (BOOL)canShareText
 {
     return YES;
 }

 + (BOOL)canShareFile
 {
     return NO;
 }

- (BOOL)shouldAutoShare
{
	return YES;
}

+ (BOOL)shareRequiresInternetConnection
{
	return NO;
}

+ (BOOL)requiresAuthentication
{
	return NO;
}


#pragma mark -
#pragma mark Configuration : Dynamic Enable

+ (BOOL)canShare
{
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"whatsapp://send?text=test"]];
}



#pragma mark -
#pragma mark Share Form


#pragma mark -
#pragma mark Implementation

 - (BOOL)validateItem
 {
     return [super validateItem];
 }

// Performs the action
- (BOOL)send
{
	// Make sure that the item has minimum requirements
	if (![self validateItem])
		return NO;
    
    NSString *stringToSend;
    if (item.URL) {
        stringToSend=self.item.URL.absoluteString;
    }
    else stringToSend=item.text;
    
    NSURL *whatsappURL = [NSURL URLWithString:[NSString stringWithFormat:@"whatsapp://send?text=%@",stringToSend]];
    
    [[UIApplication sharedApplication] openURL: whatsappURL];
            
	return YES;
}


@end
