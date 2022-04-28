#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** Detected language from text recognition. */
NS_SWIFT_NAME(TextRecognizedLanguage)
@interface MLKTextRecognizedLanguage : NSObject

/**
 * The ISO 639-1 two-letter language code if that is defined (e.g. "en"), or else the ISO 639-2
 * three-letter code if that is defined, or else a Google-specific code.
 */
@property(nonatomic, readonly, nullable) NSString *languageCode;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
