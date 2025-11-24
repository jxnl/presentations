<script setup lang="ts">
import { computed } from 'vue'
import MarkdownIt from 'markdown-it'

const md = new MarkdownIt({
  html: true,
  linkify: true,
  typographer: true
})

const renderMarkdown = (text: string) => {
  if (!text) return ''
  return md.render(text)
}

type AgentEventType = 'user' | 'thought' | 'tool-call' | 'tool-result' | 'assistant' | 'status' | 'files-explored' | 'files-edited' | 'files-read'

export interface FileInfo {
  path: string
  lines?: number
  description?: string
}

export interface AgentEvent {
  type: AgentEventType
  content: string
  title?: string
  icon?: string
  args?: Record<string, any>
  files?: FileInfo[]
  exploredCount?: number
  editedCount?: number
}

const props = withDefaults(defineProps<{
  events: AgentEvent[]
  query?: string
  stepByStep?: boolean
  height?: number
}>(), {
  stepByStep: true,
  height: 400
})

const userQuery = computed(() => {
  // Use query prop if provided, otherwise use the first user event's content
  if (props.query) {
    return props.query
  }
  const firstUserEvent = props.events.find(e => e.type === 'user')
  return firstUserEvent?.content || ''
})

// Filter out user events from content if query prop is provided (to avoid duplication)
const displayEvents = computed(() => {
  // If query prop is provided, we still show all events including user events in content
  // This allows for multiple user messages in a conversation
  return props.events
})
</script>

<template>
  <div 
    class="rounded-lg overflow-hidden shadow-sm border border-gray-200 dark:border-gray-700 bg-white dark:bg-[#1e1e1e] text-left"
    :style="{ height: height ? `${height}px` : 'auto', minHeight: height ? `${height}px` : '500px' }"
  >
    <!-- Query Input Area (like Cursor's input field) -->
    <div v-if="userQuery" class="px-4 py-3 border-b border-gray-200 dark:border-gray-700 bg-gray-50 dark:bg-[#252526]">
      <div class="text-sm text-gray-700 dark:text-gray-300 font-mono">
        {{ userQuery }}
      </div>
    </div>

    <!-- Scrollable Content Area -->
    <div 
      class="overflow-y-auto bg-black dark:bg-black p-4 text-sm"
      :style="{ height: height ? `calc(${height}px - ${userQuery ? 49 : 0}px)` : 'auto', maxHeight: height ? `calc(${height}px - ${userQuery ? 49 : 0}px)` : 'none' }"
    >
      <div class="text-gray-200 dark:text-gray-200">
        <template v-for="(event, idx) in displayEvents" :key="idx">
            <!-- Wrapper for v-click animation -->
          <div 
            :class="[
              'transition-opacity duration-300 py-3',
              idx < displayEvents.length - 1 ? 'border-b border-gray-800 dark:border-gray-800 mb-1' : '',
              stepByStep ? 'v-click' : ''
            ]"
          >
            <!-- Status Message -->
            <div v-if="event.type === 'status'" class="text-gray-300 dark:text-gray-300 font-mono">
              {{ event.content }}
            </div>

            <!-- Files Explored -->
            <div v-else-if="event.type === 'files-explored'" class="text-gray-500 dark:text-gray-500 opacity-60 font-mono">
              <span v-if="event.exploredCount !== undefined">
                Explored {{ event.exploredCount }} files
                <span class="text-gray-600 dark:text-gray-600">></span>
              </span>
              <span v-else>
                {{ event.content }}
              </span>
            </div>

            <!-- Files Edited -->
            <div v-else-if="event.type === 'files-edited'" class="text-gray-500 dark:text-gray-500 opacity-60 font-mono">
              <span v-if="event.editedCount !== undefined">
                Edited {{ event.editedCount }} files
                <span class="text-gray-600 dark:text-gray-600">></span>
              </span>
              <span v-else>
                {{ event.content }}
              </span>
            </div>

            <!-- Files Read Section -->
            <div v-else-if="event.type === 'files-read'" class="space-y-2">
              <div v-if="event.content" class="text-gray-300 dark:text-gray-300 mb-2 markdown-content" v-html="renderMarkdown(event.content)"></div>
              <div v-if="event.files && event.files.length > 0">
                <div class="text-white dark:text-white font-semibold mb-2">
                  Files Read
                </div>
                <ol class="list-decimal list-inside space-y-1 ml-4">
                  <li 
                    v-for="(file, fileIdx) in event.files" 
                    :key="fileIdx"
                    class="text-gray-300 dark:text-gray-300"
                  >
                    <span class="text-blue-400 dark:text-blue-400 hover:underline cursor-pointer">
                      {{ file.path }}
                    </span>
                    <span v-if="file.lines" class="text-gray-500 dark:text-gray-500">
                      ({{ file.lines }} lines)
                    </span>
                    <div v-if="file.description" class="text-gray-400 dark:text-gray-400 text-xs ml-6 mt-1">
                      {{ file.description }}
                    </div>
                  </li>
                </ol>
              </div>
            </div>

            <!-- Assistant -->
            <div v-else-if="event.type === 'assistant'" class="text-gray-300 dark:text-gray-300 markdown-content" v-html="renderMarkdown(event.content)"></div>

            <!-- Tool Call -->
            <div v-else-if="event.type === 'tool-call'" class="text-blue-400 dark:text-blue-400 font-mono">
              <span v-if="event.title" class="font-semibold">{{ event.title }}: </span>
              <span>{{ event.content }}</span>
              <div v-if="event.args" class="text-gray-400 dark:text-gray-400 text-xs mt-1 ml-4">
                <div v-for="(val, key) in event.args" :key="key">
                  {{ key }}: {{ val }}
                </div>
              </div>
            </div>

            <!-- Tool Result -->
            <div v-else-if="event.type === 'tool-result'" class="text-emerald-400 dark:text-emerald-400 markdown-content" v-html="renderMarkdown(event.content)"></div>

            <!-- Thought -->
            <div v-else-if="event.type === 'thought'" class="text-gray-400 dark:text-gray-400 italic markdown-content" v-html="renderMarkdown(event.content)"></div>

            <!-- User Query -->
            <div v-else-if="event.type === 'user'" class="text-gray-300 dark:text-gray-300 font-mono">
              <span class="font-semibold">User:</span> {{ event.content }}
            </div>

            <!-- Default/Assistant -->
            <div v-else class="text-gray-300 dark:text-gray-300 markdown-content" v-html="renderMarkdown(event.content)"></div>
          </div>
        </template>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Custom scrollbar for dark theme */
.overflow-y-auto::-webkit-scrollbar {
  width: 8px;
}

.overflow-y-auto::-webkit-scrollbar-track {
  background: #1a1a1a;
}

.overflow-y-auto::-webkit-scrollbar-thumb {
  background: #444;
  border-radius: 4px;
}

.overflow-y-auto::-webkit-scrollbar-thumb:hover {
  background: #555;
}

/* Markdown content styles */
.markdown-content :deep(h1),
.markdown-content :deep(h2),
.markdown-content :deep(h3),
.markdown-content :deep(h4),
.markdown-content :deep(h5),
.markdown-content :deep(h6) {
  color: inherit;
  font-weight: 600;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}

.markdown-content :deep(p) {
  margin: 0.5em 0;
}

.markdown-content :deep(ul),
.markdown-content :deep(ol) {
  margin: 0.5em 0;
  padding-left: 1.5em;
  list-style-type: disc;
}

.markdown-content :deep(ul ul),
.markdown-content :deep(ol ol) {
  list-style-type: circle;
}

.markdown-content :deep(li) {
  margin: 0.25em 0;
  display: list-item;
}

.markdown-content :deep(li::marker) {
  color: rgba(255, 255, 255, 0.5);
}

.markdown-content :deep(code) {
  background: rgba(255, 255, 255, 0.1);
  padding: 0.2em 0.4em;
  border-radius: 3px;
  font-size: 0.9em;
}

.markdown-content :deep(pre) {
  background: rgba(255, 255, 255, 0.05);
  padding: 0.75em;
  border-radius: 4px;
  overflow-x: auto;
  margin: 0.5em 0;
}

.markdown-content :deep(pre code) {
  background: transparent;
  padding: 0;
}

.markdown-content :deep(a) {
  color: #60a5fa;
  text-decoration: underline;
}

.markdown-content :deep(a:hover) {
  color: #93c5fd;
}

.markdown-content :deep(strong) {
  font-weight: 600;
}

.markdown-content :deep(em) {
  font-style: italic;
}
</style>
