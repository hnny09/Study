//
//  dispatch_once_study.m
//  Monday
//
//  Created by 张海涛(ZhangHaiTao)-顺丰科技技术集团 on 2021/8/28.
//  Copyright © 2021 haitaozhang. All rights reserved.
//

#import "dispatch_once_study.h"

@implementation dispatch_once_study

+ (instancetype)shareInstance{
    static dispatch_once_study *object = nil;
    static dispatch_once_t predicate;
    NSLog(@"dispatch_once_study-1:%ld", predicate);

    dispatch_once(&predicate, ^{
        NSLog(@"dispatch_once_study-2:%ld", predicate);
        /*
        * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
          * frame #0: 0x0000000100322054 Monday`__36+[dispatch_once_study shareInstance]_block_invoke(.block_descriptor=0x0000000100328048) at dispatch_once_study.m:20:25
            frame #1: 0x0000000100455884 libdispatch.dylib`_dispatch_client_callout + 16
            frame #2: 0x0000000100457214 libdispatch.dylib`_dispatch_once_callout + 84
            frame #3: 0x0000000100321ff8 Monday`+[dispatch_once_study shareInstance] [inlined] _dispatch_once(predicate=0x000000010032d740, block=0x000000010032203c) at once.h:84:3
            frame #4: 0x0000000100321fd8 Monday`+[dispatch_once_study shareInstance](self=dispatch_once_study, _cmd="shareInstance") at dispatch_once_study.m:19
            frame #5: 0x0000000100322238 Monday`-[ViewController viewDidLoad](self=0x000000013d605f00, _cmd="viewDidLoad") at ViewController.m:36:5
            frame #6: 0x0000000183d2ed5c UIKitCore`-[UIViewController _sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled] + 104
            frame #7: 0x0000000183d332ec UIKitCore`-[UIViewController loadViewIfRequired] + 928
            frame #8: 0x0000000183d336b8 UIKitCore`-[UIViewController view] + 28
            frame #9: 0x000000018442ca18 UIKitCore`-[UIWindow addRootViewControllerViewIfPossible] + 176
            frame #10: 0x000000018442c22c UIKitCore`-[UIWindow _updateLayerOrderingAndSetLayerHidden:actionBlock:] + 228
            frame #11: 0x000000018442d0ac UIKitCore`-[UIWindow _setHidden:forced:] + 352
            frame #12: 0x000000018443dac8 UIKitCore`-[UIWindow _mainQueue_makeKeyAndVisible] + 48
            frame #13: 0x00000001843ee374 UIKitCore`-[UIApplication _callInitializationDelegatesWithActions:forCanvas:payload:fromOriginatingProcess:] + 3560
            frame #14: 0x00000001843f3b68 UIKitCore`-[UIApplication _runWithMainScene:transitionContext:completion:] + 1156
            frame #15: 0x0000000183ad17f0 UIKitCore`-[_UISceneLifecycleMultiplexer completeApplicationLaunchWithFBSScene:transitionContext:] + 124
            frame #16: 0x0000000183ff19a4 UIKitCore`_UIScenePerformActionsWithLifecycleActionMask + 96
            frame #17: 0x0000000183ad22d8 UIKitCore`__101-[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:]_block_invoke + 196
            frame #18: 0x0000000183ad1de0 UIKitCore`-[_UISceneLifecycleMultiplexer _performBlock:withApplicationOfDeactivationReasons:fromReasons:] + 472
            frame #19: 0x0000000183ad2104 UIKitCore`-[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:] + 740
            frame #20: 0x0000000183ad19c0 UIKitCore`-[_UISceneLifecycleMultiplexer uiScene:transitionedFromState:withTransitionContext:] + 336
            frame #21: 0x0000000183ad9648 UIKitCore`__186-[_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:]_block_invoke + 188
            frame #22: 0x0000000183f0c718 UIKitCore`+[BSAnimationSettings(UIKit) tryAnimatingWithSettings:actions:completion:] + 812
            frame #23: 0x0000000184009764 UIKitCore`_UISceneSettingsDiffActionPerformChangesWithTransitionContext + 248
            frame #24: 0x0000000183ad9350 UIKitCore`-[_UIWindowSceneFBSSceneTransitionContextDrivenLifecycleSettingsDiffAction _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:] + 356
            frame #25: 0x0000000183919b8c UIKitCore`__64-[UIScene scene:didUpdateWithDiff:transitionContext:completion:]_block_invoke + 744
            frame #26: 0x0000000183918668 UIKitCore`-[UIScene _emitSceneSettingsUpdateResponseForCompletion:afterSceneUpdateWork:] + 248
            frame #27: 0x00000001839197f4 UIKitCore`-[UIScene scene:didUpdateWithDiff:transitionContext:completion:] + 220
            frame #28: 0x00000001843f20e0 UIKitCore`-[UIApplication workspace:didCreateScene:withTransitionContext:completion:] + 512
            frame #29: 0x0000000183f32d70 UIKitCore`-[UIApplicationSceneClientAgent scene:didInitializeWithEvent:completion:] + 360
            frame #30: 0x000000018566b090 FrontBoardServices`-[FBSScene _callOutQueue_agent_didCreateWithTransitionContext:completion:] + 412
            frame #31: 0x00000001856925bc FrontBoardServices`__94-[FBSWorkspaceScenesClient createWithSceneID:groupID:parameters:transitionContext:completion:]_block_invoke.176 + 100
            frame #32: 0x00000001856787b0 FrontBoardServices`-[FBSWorkspace _calloutQueue_executeCalloutFromSource:withBlock:] + 232
            frame #33: 0x00000001856922d4 FrontBoardServices`__94-[FBSWorkspaceScenesClient createWithSceneID:groupID:parameters:transitionContext:completion:]_block_invoke + 312
            frame #34: 0x0000000100455884 libdispatch.dylib`_dispatch_client_callout + 16
            frame #35: 0x0000000100458b8c libdispatch.dylib`_dispatch_block_invoke_direct + 252
            frame #36: 0x00000001856b692c FrontBoardServices`__FBSSERIALQUEUE_IS_CALLING_OUT_TO_A_BLOCK__ + 40
            frame #37: 0x00000001856b65f4 FrontBoardServices`-[FBSSerialQueue _targetQueue_performNextIfPossible] + 404
            frame #38: 0x00000001856b6ac8 FrontBoardServices`-[FBSSerialQueue _performNextFromRunLoopSource] + 28
            frame #39: 0x000000018036631c CoreFoundation`__CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 24
            frame #40: 0x000000018036621c CoreFoundation`__CFRunLoopDoSource0 + 204
            frame #41: 0x0000000180365580 CoreFoundation`__CFRunLoopDoSources0 + 256
            frame #42: 0x000000018035fbb4 CoreFoundation`__CFRunLoopRun + 744
            frame #43: 0x000000018035f3bc CoreFoundation`CFRunLoopRunSpecific + 572
            frame #44: 0x000000018afdd70c GraphicsServices`GSEventRunModal + 160
            frame #45: 0x00000001843f03d0 UIKitCore`-[UIApplication _run] + 964
            frame #46: 0x00000001843f51ac UIKitCore`UIApplicationMain + 112
            frame #47: 0x0000000100322f88 Monday`main(argc=1, argv=0x000000016faddca8) at main.m:14:16
            frame #48: 0x0000000180224554 libdyld.dylib`start + 4
         */
        object = [[dispatch_once_study alloc] init];
    });
    NSLog(@"dispatch_once_study-3:%ld", predicate);
//    if (predicate != -1) {
        predicate = -2;
//    }
    return object;
}

@end
