# SplashScreen

This is a little package that allows you to create an automatically fading splash screen. Basically, you want this to start off with the same static content that your LaunchScreen File has. When the LaunchScreen goes away this will be displayed and then you can make whatever changes to its content that you want.


Create a SplashContents struct that has your SplashScreen contents.

```
//This is where you can get creative about what is displayed.
struct SplashContents: View {
    @Binding var splashShown: Bool

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            LogoView()
                .onAppear {
                    splashShown = true
                }
        }
    }
}
```
In your Content file create a boolean state variable. Add a ZStack with a call to SplashScreen passing a duration and delay. In the block pass in your SplashContents with a binding to the state variable.

```
@State private var splashShown = false

var body: some View {
    ZStack {
        MyAppView()
        SplashScreen(duration: 2.0, delay: 2.0) {
            SplashContents(splashShown: $splashShown)
        }
    }
}
```

And that is all there is!
