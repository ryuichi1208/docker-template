func Run(input []byte, options ...Option) []byte {
	renderer := CLIRenderer{}
	renderer.Init(options...)
	output := bf.Run(input, bf.WithRenderer(&renderer), bf.WithExtensions(
		bf.NoIntraEmphasis|
			bf.Tables|
			bf.FencedCode|
			bf.Strikethrough|
			bf.BackslashLineBreak,
	))
	return output
}
