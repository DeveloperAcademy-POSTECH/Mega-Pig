#import <Foundation/Foundation.h>


#import <MLKitTextRecognitionCommon/MLKCommonTextRecognizerOptions.h>

NS_ASSUME_NONNULL_BEGIN

/** Configurations for a text recognizer for Korean and Latin-based languages. */
NS_SWIFT_NAME(KoreanTextRecognizerOptions)
@interface MLKKoreanTextRecognizerOptions : MLKCommonTextRecognizerOptions

/** Initializes a `KoreanTextRecognizerOptions` instance with the default values. */
- (instancetype)init NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
