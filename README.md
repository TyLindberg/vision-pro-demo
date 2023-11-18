# Video Web

The goal of this project was to explore a new way to find related and recommended videos in AR. 
Currently, video platforms are required to showcase recommendations in a 2D grid, but with the Apple Vision Pro there are other methods available. 
With Video Web the users can explore video recommendations that are clustered by category around their living room in 3D. In essence, this makes
the user's physical space a 3D "video library" to explore, giving the user an additional dimension to explore recommendations.

## Demo Video

https://github.com/TyLindberg/vision-pro-demo/assets/12196053/b3755b76-ec4c-4448-bed3-e1ebc3e111b7

(Please excuse the low quality. Unfortunately the VNC server was limited to 1024x768.)

## Results

This demo project showcases the first step of this project, which is enabling an additional control on Apple's built-in video player to enter into
the 3D library. By clicking this "Explore" button, the user will be presented with additional videos in the physical space around them, with the
video thumbnails and initial video being loaded via URL from AWS S3. In this demo, the video placement is randomized rather than following a clustering heuristic.

Due to the time constraint, I was unable to nail down the transition of clicking on one of the floating video thumbnails and updating the main
video window with the new URL. However, I don't believe the project is that far off from achieving it, as the error likely stemmed from some collision
issues or a state management nuance I was unaware of.

## Mood Board / Inspiration

The inspiration for this project came from tools that I have observed in the past related to relationship "webs" that cluster various topics in
2D or 3D space. Notably, a virtual reality game, Elite Dangerous, features a 3D navigation menu for exploring various planets in the galaxy; however,
it was limited by the requirement of needing to support a 2D screen with the same UI. Below are some example images showcasing the general idea.

![2D relationship web example](https://assets.kumu.io/production/public/assets/marketing/screenshots/austin-social-innovation-07082e355daad1c52319c9aaaffb66f6ce54c30b75122ac0e6b045028ce8ddd4.jpg)
![Elite Dangerous map example](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.mein-mmo.de%2Fmagazin%2Fmedien%2F2015%2F09%2FElite-Dangerous-Galaxy-Map.jpg&f=1&nofb=1&ipt=89702bb7e9ab9ba266826b7848ab5eb3a818497cd4cfb3192b0a10ab1dc411df&ipo=images)

## Future Improvements

There is a long list of improvements that could make this experience more engaging. I list some of those options below.

- Allow user to "swipe" to move the web of 3D videos around them, dynamically loading in more videos as the user explores further
- Allow the user to leverage 3D rotation gestures to spin the videos around them
- Improve thumbnail load time by loading thumbnails in parallel and/or using 2D LODs
- When the user clicks on a new video, "zoom" the web of videos over such that it appears as if that video is coming to the user's video window
- Add floating text that highlights to the user, what certain clusters are related to, similar to a tagging mechanism

## Referenced Code

Aside from the starting project that XCode generates, I also referenced the Destination Video and Hello World sample projects, which were helpful
in understanding certain conventions of Vision Pro development. Code snippets from various WWDC23 sessions were also useful for reference.
Additionally, a code snippet was referenced for loading in 2D textures from URLs at runtime.

## Final Thoughts

While I didn't quite get to where I had hoped with this project, it was an interesting foray into the world of Vision Pro development (and Swift
development in general.) While this demo UI isn't the most compelling, I do think a more polished version would be an interesting way to explore
videos, traversing down paths of this "web" to bounce from topic to topic.
