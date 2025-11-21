<script setup lang="ts">
import { computed, ref, onMounted, watch } from 'vue'
import { codeToHtml } from 'shiki'

interface TerminalLine {
  command: string
  output?: string
  prompt?: string
}

const props = withDefaults(defineProps<{
  lines?: TerminalLine[]
  command?: string
  output?: string
  prompt?: string
  shell?: 'bash' | 'zsh' | 'powershell' | 'cmd'
  title?: string
  height?: number
  copyable?: boolean
}>(), {
  prompt: '$',
  shell: 'bash',
  copyable: true,
  height: 300
})

const highlightedCommands = ref<Map<number, string>>(new Map())
const highlightedOutputs = ref<Map<number, string>>(new Map())
const isHighlighting = ref(false)
const copiedIndex = ref<number | null>(null)

const terminalLines = computed(() => {
  if (props.lines && props.lines.length > 0) {
    return props.lines.map((line, idx) => ({
      command: line.command,
      output: line.output,
      prompt: line.prompt || props.prompt,
      index: idx
    }))
  }
  
  if (props.command) {
    return [{
      command: props.command,
      output: props.output,
      prompt: props.prompt,
      index: 0
    }]
  }
  
  return []
})

const getPromptColor = (shell: string) => {
  // Use subtle colors that match the overall design
  const colors = {
    bash: 'text-gray-400',
    zsh: 'text-gray-400',
    powershell: 'text-gray-400',
    cmd: 'text-gray-400'
  }
  return colors[shell] || colors.bash
}

const highlightCommand = async (command: string, index: number) => {
  if (!command.trim()) {
    highlightedCommands.value.set(index, '')
    return
  }
  
  try {
    isHighlighting.value = true
    const html = await codeToHtml(command, {
      lang: props.shell === 'powershell' ? 'powershell' : 'bash',
      theme: 'github-dark'
    })
    highlightedCommands.value.set(index, html)
  } catch (error) {
    console.error('Failed to highlight command:', error)
    highlightedCommands.value.set(index, '')
  } finally {
    isHighlighting.value = false
  }
}

const highlightOutput = async (output: string, index: number) => {
  if (!output || !output.trim()) {
    highlightedOutputs.value.set(index, '')
    return
  }
  
  // Try to detect output type - if it looks like JSON, highlight as JSON
  // Otherwise, treat as plain text
  let lang = 'text'
  const trimmed = output.trim()
  if ((trimmed.startsWith('{') && trimmed.endsWith('}')) || 
      (trimmed.startsWith('[') && trimmed.endsWith(']'))) {
    lang = 'json'
  } else if (trimmed.includes('error') || trimmed.includes('Error')) {
    lang = 'text'
  }
  
  try {
    const html = await codeToHtml(output, {
      lang,
      theme: 'github-dark'
    })
    highlightedOutputs.value.set(index, html)
  } catch (error) {
    // If highlighting fails, just store as plain text
    highlightedOutputs.value.set(index, '')
  }
}

const copyToClipboard = async (text: string, index: number) => {
  try {
    await navigator.clipboard.writeText(text)
    copiedIndex.value = index
    setTimeout(() => {
      copiedIndex.value = null
    }, 2000)
  } catch (error) {
    console.error('Failed to copy:', error)
  }
}

onMounted(() => {
  terminalLines.value.forEach((line, idx) => {
    highlightCommand(line.command, idx)
    if (line.output) {
      highlightOutput(line.output, idx)
    }
  })
})

watch(() => props.lines, () => {
  highlightedCommands.value.clear()
  highlightedOutputs.value.clear()
  terminalLines.value.forEach((line, idx) => {
    highlightCommand(line.command, idx)
    if (line.output) {
      highlightOutput(line.output, idx)
    }
  })
}, { deep: true })

watch(() => props.command, () => {
  highlightedCommands.value.clear()
  highlightedOutputs.value.clear()
  terminalLines.value.forEach((line, idx) => {
    highlightCommand(line.command, idx)
    if (line.output) {
      highlightOutput(line.output, idx)
    }
  })
})
</script>

<template>
  <div 
    class="rounded-lg overflow-hidden shadow-sm border border-gray-200 dark:border-gray-700 bg-white dark:bg-[#1e1e1e] text-left"
    :style="{ height: height ? `${height}px` : 'auto', minHeight: height ? `${height}px` : '300px' }"
  >
    <!-- Terminal Header -->
    <div class="px-4 py-2 border-b border-gray-200 dark:border-gray-700 bg-gray-50 dark:bg-[#252526]">
      <div class="text-xs font-bold text-gray-500 uppercase tracking-wider">
        <span v-if="title">{{ title }}</span>
        <span v-else>{{ shell }}</span>
      </div>
    </div>

    <!-- Terminal Content -->
    <div class="p-4 overflow-auto font-mono text-sm bg-[#0d1117]" :style="{ height: height ? `calc(${height}px - 41px)` : 'auto', maxHeight: height ? `calc(${height}px - 41px)` : 'none' }">
      <div v-for="(line, idx) in terminalLines" :key="idx" class="mb-4 last:mb-0">
        <!-- Command Line -->
        <div class="flex items-start gap-2 mb-1">
          <span :class="['flex-shrink-0', getPromptColor(shell)]">{{ line.prompt }}</span>
          <div class="flex-1 min-w-0">
            <div class="flex items-start gap-2 group">
              <div 
                v-if="highlightedCommands.get(idx) && !isHighlighting"
                class="flex-1 shiki-wrapper"
                v-html="highlightedCommands.get(idx)"
              ></div>
              <pre 
                v-else
                class="flex-1 text-gray-300 whitespace-pre-wrap break-words"
              >{{ line.command }}</pre>
              <button
                v-if="copyable"
                @click="copyToClipboard(line.command, idx)"
                class="opacity-0 group-hover:opacity-100 transition-opacity flex-shrink-0 p-1 hover:bg-gray-800 rounded text-gray-500 hover:text-gray-300"
                :title="copiedIndex === idx ? 'Copied!' : 'Copy command'"
              >
                <span v-if="copiedIndex === idx" class="i-carbon:checkmark text-xs"></span>
                <span v-else class="i-carbon:copy text-xs"></span>
              </button>
            </div>
          </div>
        </div>

        <!-- Output -->
        <div v-if="line.output" class="ml-6 mt-1 text-gray-400">
          <div 
            v-if="highlightedOutputs.get(idx)"
            class="shiki-wrapper"
            v-html="highlightedOutputs.get(idx)"
          ></div>
          <pre 
            v-else
            class="whitespace-pre-wrap break-words"
          >{{ line.output }}</pre>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.shiki-wrapper {
  margin: 0;
}

.shiki-wrapper :deep(pre) {
  margin: 0;
  padding: 0;
  background: transparent !important;
}

.shiki-wrapper :deep(code) {
  font-family: 'Fira Code', 'Consolas', 'Monaco', monospace;
  font-size: 0.875rem;
  line-height: 1.5;
  display: block;
  width: 100%;
}
</style>

