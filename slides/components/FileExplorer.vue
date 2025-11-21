<script setup lang="ts">
import { computed, ref, onMounted } from 'vue'
import FileTreeItem from './FileTreeItem.vue'

const props = defineProps<{
  dir: string
}>()

// Load all files from the decks directory using a broad glob
// We use 'as: 'raw' to get the content string
// Path is relative to this component file location (slides/components/)
const modules = import.meta.glob('../decks/**/*', { as: 'raw', eager: true })

interface FileNode {
  name: string
  path: string
  type: 'file' | 'directory'
  children?: FileNode[]
  content?: string
  isOpen?: boolean
}

const selectedFile = ref<FileNode | null>(null)
const expandedFolders = ref<Set<string>>(new Set())

// Normalize path to remove leading slashes and ensure consistency
const normalizePath = (p: string) => p.replace(/^\//, '').replace(/\/$/, '')

const fileTree = computed(() => {
  const tree: FileNode[] = []
  // The glob returns paths like '../decks/components/example_fs/fastapi-app/README.md'
  // We need to match against the target directory
  const targetDir = normalizePath(props.dir)
  const targetDirFull = `decks/${targetDir}`
  
  // Filter files that belong to the target directory
  const relevantFiles = Object.entries(modules).filter(([path]) => {
    // Normalize the glob path - it comes as '../decks/...'
    return path.includes(targetDirFull)
  })

  relevantFiles.forEach(([path, content]) => {
    // Extract relative path from the glob path
    // e.g., '../decks/components/example_fs/fastapi-app/src/app.py' -> 'src/app.py'
    const index = path.indexOf(targetDirFull)
    if (index === -1) return

    const relativePath = path.slice(index + targetDirFull.length + 1)
    if (!relativePath) return

    const parts = relativePath.split('/')
    let currentLevel = tree

    parts.forEach((part, i) => {
      const isFile = i === parts.length - 1
      const existingNode = currentLevel.find(n => n.name === part)

      if (existingNode) {
        if (!isFile) {
          currentLevel = existingNode.children!
        }
      } else {
        const newNode: FileNode = {
          name: part,
          path: path,
          type: isFile ? 'file' : 'directory',
          children: isFile ? undefined : [],
          content: isFile ? content : undefined
        }
        currentLevel.push(newNode)
        if (!isFile) {
          currentLevel = newNode.children!
        }
      }
    })
  })

  const sortNodes = (nodes: FileNode[]) => {
    nodes.sort((a, b) => {
      if (a.type === b.type) return a.name.localeCompare(b.name)
      return a.type === 'directory' ? -1 : 1
    })
    nodes.forEach(node => {
      if (node.children) sortNodes(node.children)
    })
  }
  sortNodes(tree)
  
  return tree
})

onMounted(() => {
  const findFirstFile = (nodes: FileNode[]): FileNode | null => {
    for (const node of nodes) {
      if (node.type === 'file') return node
      if (node.children) {
        const found = findFirstFile(node.children)
        if (found) return found
      }
    }
    return null
  }
  
  if (fileTree.value.length > 0) {
    const first = findFirstFile(fileTree.value)
    if (first) handleFileClick(first)
    
    const expandAll = (nodes: FileNode[]) => {
      nodes.forEach(node => {
        if (node.type === 'directory') {
          expandedFolders.value.add(node.path)
          if (node.children) expandAll(node.children)
        }
      })
    }
    expandAll(fileTree.value)
  }
})

const handleFileClick = (node: FileNode) => {
  selectedFile.value = node
}

const toggleFolder = (node: FileNode) => {
  if (expandedFolders.value.has(node.path)) {
    expandedFolders.value.delete(node.path)
  } else {
    expandedFolders.value.add(node.path)
  }
}

const getFileIcon = (name: string) => {
  if (name.endsWith('.py')) return 'i-vscode-icons:file-type-python'
  if (name.endsWith('.md')) return 'i-vscode-icons:file-type-markdown'
  if (name.endsWith('.ts')) return 'i-vscode-icons:file-type-typescript'
  if (name.endsWith('.json')) return 'i-vscode-icons:file-type-json'
  return 'i-vscode-icons:default-file'
}
</script>

<template>
  <div class="flex h-[400px] border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden shadow-sm text-sm font-mono bg-white dark:bg-[#1e1e1e] text-left">
    <!-- Sidebar -->
    <div class="w-64 flex-shrink-0 border-r border-gray-200 dark:border-gray-700 bg-gray-50 dark:bg-[#252526] overflow-y-auto">
      <div class="p-2 text-xs font-bold text-gray-500 uppercase tracking-wider pl-4">Explorer</div>
      
      <div class="flex flex-col pb-2">
        <FileTreeItem 
          v-for="node in fileTree" 
          :key="node.path"
          :node="node"
          :expanded-folders="expandedFolders"
          :selected-file="selectedFile"
          @toggle="toggleFolder"
          @select="handleFileClick"
        />
      </div>
    </div>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col min-w-0 bg-white dark:bg-[#1e1e1e]">
      <div v-if="selectedFile" class="flex-1 flex flex-col min-h-0">
        <!-- Tab Header -->
        <div class="flex border-b border-gray-200 dark:border-gray-700 bg-gray-50 dark:bg-[#2d2d2d]">
          <div class="px-3 py-2 bg-white dark:bg-[#1e1e1e] border-t-2 border-t-blue-500 text-gray-800 dark:text-gray-100 flex items-center gap-2">
             <span :class="[getFileIcon(selectedFile.name), 'text-sm']"></span>
            {{ selectedFile.name }}
            <span class="ml-2 hover:bg-gray-200 dark:hover:bg-gray-700 rounded p-0.5 cursor-pointer" @click="selectedFile = null">
              <div class="i-carbon:close text-xs"></div>
            </span>
          </div>
        </div>

        <!-- Code Content -->
        <div class="flex-1 overflow-auto p-4">
          <pre class="font-mono text-sm leading-relaxed text-gray-800 dark:text-gray-300 whitespace-pre-wrap">{{ selectedFile.content }}</pre>
        </div>
      </div>
      <div v-else class="flex-1 flex items-center justify-center text-gray-400">
        Select a file to view
      </div>
    </div>
  </div>
</template>
