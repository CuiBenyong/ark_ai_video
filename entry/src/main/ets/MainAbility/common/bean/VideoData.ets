
export enum VideoAspect {
  landscape = '16:9',
  portrait = '9:16',
  square = '1:1'
}

export enum VideoConcatMode {
  random = 'random',
  sequential = 'sequential'
}

export enum SubtitlePosition {
  top = 'top',
  center = 'center',
  bottom = 'bottom'
}


export class VideoData {
  video_subject: String;
  video_script: String;
  video_subtitle: String;
  video_terms: String;
  video_aspect: VideoAspect;
  video_concat_mode: VideoConcatMode;
  video_clip_duration: Number;
  video_count: Number;

  voice_name: String;
  voice_volume: Number;
  bgm_volume: Number;
  subtitle_enabled: Boolean;
  subtitle_position: SubtitlePosition;
  font_name: String;
  font_size: Number;
  stroke_width: Number;
}