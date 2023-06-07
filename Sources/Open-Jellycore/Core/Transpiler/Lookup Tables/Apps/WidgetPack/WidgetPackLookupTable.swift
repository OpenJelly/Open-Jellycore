//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var WidgetPackFunctions: [String : AnyAction] = [
  "modifierMinimumScaleFactor": Action<ModifierMinimumScaleFactorParameter>(name: "Modifier: Minimum Scale Factor", identifier: "ke.bou.WidgetPack.ModifierMinimumScaleFactorIntent", correctTypedFunction: "modifierMinimumScaleFactor", description: """
                                Set minimum scale factor of text in a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "imageFile": Action<ImageFileParameter>(name: "Image", identifier: "ke.bou.WidgetPack.ImageFileIntent", correctTypedFunction: "imageFile", description: """
                                Display an image. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierRelativeFrame": Action<ModifierRelativeFrameParameter>(name: "Modifier: Relative Frame", identifier: "ke.bou.WidgetPack.ModifierRelativeFrameIntent", correctTypedFunction: "modifierRelativeFrame", description: """
                                Set frame of a view relative to container. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "verbatimText": Action<VerbatimTextParameter>(name: "Text", identifier: "ke.bou.WidgetPack.VerbatimTextIntent", correctTypedFunction: "verbatimText", description: """
                                Display text. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierScaledToFit": Action<ModifierScaledToFitParameter>(name: "Modifier: Scaled To Fit", identifier: "ke.bou.WidgetPack.ModifierScaledToFitIntent", correctTypedFunction: "modifierScaledToFit", description: """
                                Scale a view to fit in a container. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierFixedFrame": Action<ModifierFixedFrameParameter>(name: "Modifier: Fixed Frame", identifier: "ke.bou.WidgetPack.ModifierFixedFrameIntent", correctTypedFunction: "modifierFixedFrame", description: """
                                Set frame of a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "text": Action<WidgetPack_TextParameter>(name: "Text", identifier: "ke.bou.WidgetPack.TextIntent", correctTypedFunction: "text", description: """
                                Display text. You can display text verbatim, or specify a timestamp to display a text relative to.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierBorder": Action<ModifierBorderParameter>(name: "Modifier: Border", identifier: "ke.bou.WidgetPack.ModifierBorderIntent", correctTypedFunction: "modifierBorder", description: """
                                Add a border to a view. The border is inset, so you should add some padding if you want it around your view. You can use gradients and colors to specify the border. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "progressView": Action<ProgressViewParameter>(name: "Progress View", identifier: "ke.bou.WidgetPack.ProgressViewIntent", correctTypedFunction: "progressView", description: """
                                Progress view.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "link": Action<LinkParameter>(name: "Link", identifier: "ke.bou.WidgetPack.LinkIntent", correctTypedFunction: "link", description: """
                                Create a link. A linked view shows up the same, but tapping it opens the specified URL.
                                Note that links only work on Medium and Large widgets. For small widgets you can specify a URL with the 'Update Widget' action. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierGrayscale": Action<ModifierGrayscaleParameter>(name: "Modifier: Grayscale", identifier: "ke.bou.WidgetPack.ModifierGrayscaleIntent", correctTypedFunction: "modifierGrayscale", description: """
                                Make view grayscale. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "font": Action<FontParameter>(name: "Font", identifier: "ke.bou.WidgetPack.FontIntent", correctTypedFunction: "font", description: """
                                Create a custom font. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setProperty": Action<SetPropertyParameter>(name: "Set Property", identifier: "ke.bou.WidgetPack.SetPropertyIntent", correctTypedFunction: "setProperty", description: """
                                Set a property on a view.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierContrast": Action<ModifierContrastParameter>(name: "Modifier: Contrast", identifier: "ke.bou.WidgetPack.ModifierContrastIntent", correctTypedFunction: "modifierContrast", description: """
                                Change contrast of a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierShadow": Action<ModifierShadowParameter>(name: "Modifier: Shadow", identifier: "ke.bou.WidgetPack.ModifierShadowIntent", correctTypedFunction: "modifierShadow", description: """
                                Add a shadow to a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierColorInvert": Action<ModifierColorInvertParameter>(name: "Modifier: Color Invert", identifier: "ke.bou.WidgetPack.ModifierColorInvertIntent", correctTypedFunction: "modifierColorInvert", description: """
                                Invert colors of a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierFixedSize": Action<ModifierFixedSizeParameter>(name: "Modifier: Fixed Size", identifier: "ke.bou.WidgetPack.ModifierFixedSizeIntent", correctTypedFunction: "modifierFixedSize", description: """
                                Make a view fixed size. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierPadding": Action<ModifierPaddingParameter>(name: "Modifier: Padding", identifier: "ke.bou.WidgetPack.ModifierPaddingIntent", correctTypedFunction: "modifierPadding", description: """
                                Add padding to a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierClipped": Action<ModifierClippedParameter>(name: "Modifier: Clipped", identifier: "ke.bou.WidgetPack.ModifierClippedIntent", correctTypedFunction: "modifierClipped", description: """
                                Clip a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierOpacity": Action<ModifierOpacityParameter>(name: "Modifier: Opacity", identifier: "ke.bou.WidgetPack.ModifierOpacityIntent", correctTypedFunction: "modifierOpacity", description: """
                                Make view (slightly) opaque. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierScaledToFill": Action<ModifierScaledToFillParameter>(name: "Modifier: Scaled To Fill", identifier: "ke.bou.WidgetPack.ModifierScaledToFillIntent", correctTypedFunction: "modifierScaledToFill", description: """
                                Scale a view to fill a container. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierOverlay": Action<ModifierOverlayParameter>(name: "Modifier: Overlay", identifier: "ke.bou.WidgetPack.ModifierOverlayIntent", correctTypedFunction: "modifierOverlay", description: """
                                Add an overlay to a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "verticalStack": Action<VerticalStackParameter>(name: "Vertical Stack", identifier: "ke.bou.WidgetPack.VerticalStackIntent", correctTypedFunction: "verticalStack", description: """
                                Create a vertical stack. This action should be used together with 'List' to pass in the views you want to display next to each other. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierBackground": Action<ModifierBackgroundParameter>(name: "Modifier: Background", identifier: "ke.bou.WidgetPack.ModifierBackgroundIntent", correctTypedFunction: "modifierBackground", description: """
                                Add a background to a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shape": Action<ShapeParameter>(name: "Shape", identifier: "ke.bou.WidgetPack.ShapeIntent", correctTypedFunction: "shape", description: """
                                Create a simple shape. Set the 'foreground color' property to change the color. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formattedDate": Action<FormattedDateParameter>(name: "Formatted Date", identifier: "ke.bou.WidgetPack.FormattedDateIntent", correctTypedFunction: "formattedDate", description: """
                                Display formatted date as text. You specify a timestamp which is formatted in a way you specify. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "spacer": Action<SpacerParameter>(name: "Spacer", identifier: "ke.bou.WidgetPack.SpacerIntent", correctTypedFunction: "spacer", description: """
                                Create a spacer. This is used to align views in a horizontal or vertical stack. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "color": Action<ColorParameter>(name: "Color", identifier: "ke.bou.WidgetPack.ColorIntent", correctTypedFunction: "color", description: """
                                Create a color. You can display a color directly, or use it to specify a property on another view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "updateWidget": Action<UpdateWidgetParameter>(name: "Update Widget", identifier: "ke.bou.WidgetPack.UpdateWidgetIntent", correctTypedFunction: "updateWidget", description: """
                                Update a named widget with a new view. You can assign a URL to open when the widget is tapped.
                                Note that if you execute this action too many times, then iOS might delay an update. You can use 'Preview Widget' to quickly compare changes you're making. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierAccentColor": Action<ModifierAccentColorParameter>(name: "Modifier: Accent Color", identifier: "ke.bou.WidgetPack.ModifierAccentColorIntent", correctTypedFunction: "modifierAccentColor", description: """
                                You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "zStack": Action<ZStackParameter>(name: "Z-Stack", identifier: "ke.bou.WidgetPack.ZStackIntent", correctTypedFunction: "zStack", description: """
                                Create a Z (overlay) stack. This action should be used together with 'List' to pass in the views you want to display next to each other. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierClipShape": Action<ModifierClipShapeParameter>(name: "Modifier: Clip Shape", identifier: "ke.bou.WidgetPack.ModifierClipShapeIntent", correctTypedFunction: "modifierClipShape", description: """
                                Clip a view with a shape. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "horizontalStack": Action<HorizontalStackParameter>(name: "Horizontal Stack", identifier: "ke.bou.WidgetPack.HorizontalStackIntent", correctTypedFunction: "horizontalStack", description: """
                                Create a horizontal stack. This action should be used together with 'List' to pass in the views you want to display next to each other. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "stack": Action<StackParameter>(name: "Stack", identifier: "ke.bou.WidgetPack.StackIntent", correctTypedFunction: "stack", description: """
                                Create a horizontal, vertical or Z (overlay) stack. This action should be used together with 'List' to pass in the views you want to display next to each other. 
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierMask": Action<ModifierMaskParameter>(name: "Modifier: Mask", identifier: "ke.bou.WidgetPack.ModifierMaskIntent", correctTypedFunction: "modifierMask", description: """
                                Mask a view with another. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierFont": Action<ModifierFontParameter>(name: "Modifier: Font", identifier: "ke.bou.WidgetPack.ModifierFontIntent", correctTypedFunction: "modifierFont", description: """
                                Set the font for a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierForegroundColor": Action<ModifierForegroundColorParameter>(name: "Modifier: Foreground Color", identifier: "ke.bou.WidgetPack.ModifierForegroundColorIntent", correctTypedFunction: "modifierForegroundColor", description: """
                                Add a foreground color. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "widgetConfiguration": Action<WidgetConfigurationParameter>(name: "Widget Configuration", identifier: "ke.bou.WidgetPack.WidgetConfigurationIntent", correctTypedFunction: "widgetConfiguration", description: """
                                Configure the widget
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "gradient": Action<GradientParameter>(name: "Gradient", identifier: "ke.bou.WidgetPack.GradientIntent", correctTypedFunction: "gradient", description: """
                                Create a gradient. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "image": Action<ImageParameter>(name: "Image", identifier: "ke.bou.WidgetPack.ImageIntent", correctTypedFunction: "image", description: """
                                Display an image or SF Symbol.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierSaturation": Action<ModifierSaturationParameter>(name: "Modifier: Saturation", identifier: "ke.bou.WidgetPack.ModifierSaturationIntent", correctTypedFunction: "modifierSaturation", description: """
                                Change saturation of a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "previewWidget": Action<PreviewWidgetParameter>(name: "Preview Widget", identifier: "ke.bou.WidgetPack.PreviewWidgetIntent", correctTypedFunction: "previewWidget", description: """
                                Preview a widget. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "serializeView": Action<SerializeViewParameter>(name: "Serialize View", identifier: "ke.bou.WidgetPack.SerializeViewIntent", correctTypedFunction: "serializeView", description: """
                                Serialize a view
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierBrightness": Action<ModifierBrightnessParameter>(name: "Modifier: Brightness", identifier: "ke.bou.WidgetPack.ModifierBrightnessIntent", correctTypedFunction: "modifierBrightness", description: """
                                Brighten colors of a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "sFSymbol": Action<SFSymbolParameter>(name: "SF Symbol", identifier: "ke.bou.WidgetPack.SFSymbolIntent", correctTypedFunction: "sFSymbol", description: """
                                Display an SF Symbol. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "modifierRotation": Action<ModifierRotationParameter>(name: "Modifier: Rotation", identifier: "ke.bou.WidgetPack.ModifierRotationIntent", correctTypedFunction: "modifierRotation", description: """
                                Rotate a view. You can find more info at https://widgetpack.app/documentation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
