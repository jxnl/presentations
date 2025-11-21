<script setup lang="ts">
import { computed } from 'vue'

interface FileNode {
  name: string
  path: string
  type: 'file' | 'directory'
  children?: FileNode[]
  content?: string
  isOpen?: boolean
}

const props = defineProps<{
  node: FileNode
  expandedFolders: Set<string>
  selectedFile: FileNode | null
  depth?: number
}>()

const emit = defineEmits<{
  (e: 'toggle', node: FileNode): void
  (e: 'select', node: FileNode): void
}>()

const depth = props.depth || 0
const isExpanded = computed(() => props.expandedFolders.has(props.node.path))
const isSelected = computed(() => props.selectedFile?.path === props.node.path)

const getFileIcon = (name: string) => {
  if (name.endsWith('.py')) return 'i-vscode-icons:file-type-python'
  if (name.endsWith('.md')) return 'i-vscode-icons:file-type-markdown'
  if (name.endsWith('.ts')) return 'i-vscode-icons:file-type-typescript'
  if (name.endsWith('.json')) return 'i-vscode-icons:file-type-json'
  return 'i-vscode-icons:default-file'
}
</script>

<template>
  <div>
    <div v-if="node.type === 'directory'">
      <div 
        class="flex items-center px-2 py-1 cursor-pointer hover:bg-gray-200 dark:hover:bg-[#2a2d2e] text-gray-700 dark:text-gray-300 select-none"
        :style="{ paddingLeft: `${depth * 12 + 8}px` }"
        @click="emit('toggle', node)"
      >
        <span 
          class="mr-1 transform transition-transform text-gray-500 flex items-center justify-center w-4 h-4"
          :class="isExpanded ? 'rotate-90' : ''"
        >
          <div class="i-carbon:chevron-right text-xs"></div>
        </span>
        <span class="i-vscode-icons:default-folder mr-2 text-base flex-shrink-0"></span>
        <span class="truncate">{{ node.name }}</span>
      </div>
      
      <div v-if="isExpanded">
        <FileTreeItem 
          v-for="child in node.children" 
          :key="child.path"
          :node="child"
          :expanded-folders="expandedFolders"
          :selected-file="selectedFile"
          :depth="depth + 1"
          @toggle="(n) => emit('toggle', n)"
          @select="(n) => emit('select', n)"
        />
      </div>
    </div>

    <div v-else>
      <div 
        class="flex items-center px-2 py-1 cursor-pointer hover:bg-gray-200 dark:hover:bg-[#2a2d2e] select-none"
        :class="{ 'bg-blue-100 dark:bg-[#37373d] text-blue-800 dark:text-white': isSelected, 'text-gray-700 dark:text-gray-300': !isSelected }"
        :style="{ paddingLeft: `${depth * 12 + 28}px` }"
        @click="emit('select', node)"
      >
         <span :class="[getFileIcon(node.name), 'mr-2 text-base flex-shrink-0']"></span>
        <span class="truncate">{{ node.name }}</span>
      </div>
    </div>
  </div>
</template>

