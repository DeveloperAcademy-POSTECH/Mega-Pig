#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

@class MLKTextElement;
@class MLKTextRecognizedLanguage;

NS_ASSUME_NONNULL_BEGIN

/** A text line recognized in an image that consists of an array of elements. */
NS_SWIFT_NAME(TextLine)
@interface MLKTextLine : NSObject

/** String representation of the text line that was recognized. */
@property(nonatomic, readonly) NSString *text;

/** An array of text elements that make up the line. */
@property(nonatomic, readonly) NSArray<MLKTextElement *> *elements;

/**
 * The rectangle that contains the text line relative to the image in the default coordinate space.
 */
@property(nonatomic, readonly) CGRect frame;

/**
 * An array of recognized languages in the text line. If no languages were recognized, the array is
 * empty.
 */
@property(nonatomic, readonly) NSArray<MLKTextRecognizedLanguage *> *recognizedLanguages;

/**
 * The four corner points of the text line in clockwise order starting with the top left point
 * relative to the image in the default coordinate space. The `NSValue` objects are `CGPoint`s.
 */
@property(nonatomic, readonly) NSArray<NSValue *> *cornerPoints;

/** Unavailable. */
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
