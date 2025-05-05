import { BlazeSlider } from '../slider'

export function onSlideEnd(slider: BlazeSlider) {
  if (slider.onSlideCbs) {
    const state = slider.states[slider.stateIndex]
    const [firstSlideIndex, lastSlideIndex] = state.page
    slider.onSlideCbs.forEach((cb) =>
      cb(slider.stateIndex, firstSlideIndex, lastSlideIndex)
    )
  }
}
