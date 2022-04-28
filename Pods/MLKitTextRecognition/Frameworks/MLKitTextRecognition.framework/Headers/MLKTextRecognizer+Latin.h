#import <Foundation/Foundation.h>


#import <MLKitTextRecognitionCommon/MLKTextRecognizer.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Extensions to `TextRecognizer` to provide a default text recognizer for Latin-based languages.
 */
@interface MLKTextRecognizer (Latin)

/**
 * DEPRECATED. Use `textRecognizer(options:)` instead.
 *
 * Returns a text recognizer for Latin-based languages.
 *
 * @return A text recognizer for Latin-based languages.
 */
+ (instancetype)textRecognizer NS_SWIFT_NAME(textRecognizer())
    __deprecated_msg("Please use `textRecognizer(options:)` instead.");
;

@end

NS_ASSUME_NONNULL_END
