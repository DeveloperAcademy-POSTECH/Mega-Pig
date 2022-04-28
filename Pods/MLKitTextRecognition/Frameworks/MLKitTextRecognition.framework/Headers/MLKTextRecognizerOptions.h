#import <Foundation/Foundation.h>


#import <MLKitTextRecognitionCommon/MLKCommonTextRecognizerOptions.h>

NS_ASSUME_NONNULL_BEGIN

/** Configurations for a text recognizer for Latin-based languages. */
NS_SWIFT_NAME(TextRecognizerOptions)
@interface MLKTextRecognizerOptions : MLKCommonTextRecognizerOptions

/** Initializes a `TextRecognizerOptions` instance with the default values. */
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
