# 音标音频文件夹

把精选真人音标音频 `.mp3` 放在分类文件夹里，网页会自动优先播放。

目录结构：

- `phonemes/vowels/`：单元音
- `phonemes/diphthongs/`：双元音
- `phonemes/consonants/`：辅音
- `words/`：单词读音

命名请参考 `audio-manifest.csv`，例如：

- `phonemes/vowels/i-long.mp3` 对应 `/i:/`
- `phonemes/vowels/i-short.mp3` 对应 `/ɪ/`
- `phonemes/consonants/theta.mp3` 对应 `/θ/`
- `phonemes/consonants/sh.mp3` 对应 `/ʃ/`

如果某个音标文件不存在，网页会自动播放该音标的一个代表词作为兜底试听。

建议录音标准：

- 每个文件 0.6-1.2 秒
- 开头和结尾留 80-150 毫秒空白
- 音量统一，不要爆音
- 单个音标读 1 次
- 辅音不要加明显中文元音，比如 `/p/` 不要读成“扑”
